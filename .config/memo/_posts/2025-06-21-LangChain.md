# LangChain

[link to video by IBM](https://www.youtube.com/watch?v=1bUy-1hGZpI)

Langchain is a framework used to pipe together llm inputs/outputs into each other to build full application. It is made up of a few components

## LLM module:

Holds any LLM

## Prompts:

Formalizes composing prompts without hard coding context, queries etc.

e.g:

- Do not use technical terms in your response
- Summarize, don't use emojis

## Chains:

Combine LLMs with other components.

(Retrieve data) -> (Summarize text) -> (Send to another prompt)

## Indexes

What if you want to customize with internal documentation ? This is what Indexes are for.

### Doc. Loader:

Work with third party to import data sources like dropbox, google drive, youtube, databases.

### Vector DB:

Supports vector databases (_Use Embeddings_)

### Text splitters;

Splits text in small meaningful chunks

## Memory:

Can keep the entire conversations or just summaries of conversations.

## Agents:

Use models as a reasoning engine:

- Available tools
- User inputs
- Previously executed steps
