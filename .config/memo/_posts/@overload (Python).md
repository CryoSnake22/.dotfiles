# @overload (Python)

**File:** `/Users/charlo/dev/python/LangGraph/codecamptut/venv/lib/python3.12/site-packages/langchain_core/messages/base.py`

## Notes

Let's say we have some function

```py
from typing import overload

@overload
def parse(data: str) -> dict: ...           # Contract: str in → dict out

@overload
def parse(data: bytes) -> list: ...         # Contract: bytes in → list out

def parse(data: str | bytes) -> dict | list:
    if isinstance(data, str):
        return {"result": data}  # Must return dict to honor contract
    else:
        return [data]            # Must return list to honor contract

```

`@overload` essentially forces the function call to respect the overloaded signatures. The implementation signature becomes null and void and we now hwave to follow the overloaded signatures.
