# LangGraph Agentic Workflows

**File:** `/Users/charlo/dev/python/jupyter/Testing/PythonArena/tooling.py`

## Notes

Tools are things models can call to get info from external sources.

The DocString acts as the tool description for the tool.

```py
from langchain.tools import tool

@tool
def search_database(query: str, limit: int = 10) -> str:
    """Search the customer database for records matching the query.

    Args:
        query: Search terms to look for
        limit: Maximum number of results to return
    """
    return f"Found {limit} results for '{query}'"
```
