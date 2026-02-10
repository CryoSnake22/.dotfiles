# LangGraph

**File:** `/Users/charlo/dev/python/LangGraph/codecamptut/main.py`

## Notes

There are many important details associated with LangGraph which need to be addressed.

I will be focusing on using langgraph in a pydantic focused manner since I want to keep runtime typing.

## Canonical way to handle things

```py
class Model(TypedDict):
  foo: str
  bar: str

def node(state: Model)->Model:
  return {"foo": "test"} # only return partials

```

## Basics

The main workflow object in langgraph comes from the `StateGraph` you can add nodes and add edges between nodes as well as some control flow elements such as conditional edges.

The main way you handle type safety is either through a `TypedDict` or a pydantic `BaseModel` class.

```py
from typing import TypedDict
from pydantic import BaseModel

class Model(BaseModel):
    message: str
    foo: str

class Model(TypedDict):
    message: str
    foo: str
```

We define nodes as functions which modify the state:

```py
def node(state : Model):

```

## Input and Output Schemas:

```py
class InputState(TypedDict):
  question: str


class OutputState(TypedDict):
  answer: str


class InternalState(TypedDict):
  answer: str
```

## Reducer functions

When returning a state in a node, you are implicitly calling the _reducer function for each member of the state_. Here are some examples:

```py
class State(TypedDict):
  foo: int
  bar: list[str]


# if I use initial state {foo: 0, bar: ["hi"]}:
def node_a(State):
  return {"foo": 2} # {foo: 2, bar: ["hi"]}

def node_b(State):
  return {"bar": ["bye"]} # {foo: 2, bar: ["bye"]}

# When no reducers are specified the default behaviour is to override everything.
from operator import add

class State(TypedDict):
  foo: int
  bar: Annotated[list[str], add]

```

now when we return `{"bar": ["bye"]}` the state updates to: `{foo: 2 , bar: ["hi","bye"]}` since we changed the function to add.

If you have an custom reducer and want to make sure you overwrite a message you can simply do
`return {foo: 2, bar: Overwrite(["replacement message"])}`

## Returning Structured Output

## Some Error Handling

in Pydantic you can do `state.model_dump()` to dump a dict of the model and then you can convert it back if you want type safety at any point.

```py
def testNode(state: Model) -> Model:
    print("test")
    state.message = 1
    try:
        return state.model_validate(state.model_dump())
    except Exception as e:
        print(
            str(e) + "\n Responsible function: " + str(sys._getframe().f_code.co_name)
        )
```

That's one way to

## Displaying graphs:

You need to compile first then :

```py
png_bytes = graph.get_graph().draw_mermaid_png()
with open("graph.png", "wb") as f:
    f.write(png_bytes)
```

## Input and Ouput Schemas:

```py

from langgraph.graph import StateGraph, START, END
from typing import List, TypedDict


class InputState(TypedDict):
    values: List[int]
    name: str


class OutputState(TypedDict):
    result: str


class AgentState(InputState, OutputState, TypedDict):
    values: List[int]
    name: str
    result: str


def node(state: InputState) -> OutputState:
    print(state)
    return {
        "result": f"hey {state['name']}!, the sum of your values is: {sum(state['values'])}"
    }


workflow = StateGraph(AgentState, input_schema=InputState, output_schema=OutputState)

workflow.add_node("node", node)
workflow.add_edge(START, "node")
workflow.add_edge("node", END)

graph = workflow.compile()

state = OutputState(**graph.invoke({"values": [1, 2, 3], "name": "Bob"}))

print(state)
```

## Initial values

I think it might be smart to have an init node with a bunch of initial values for counters etc. and also one important thing is I'd like to explore what the deign for local counters would look like for schema validation etc.
