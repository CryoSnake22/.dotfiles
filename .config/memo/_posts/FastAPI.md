# FastAPI

**File:** `/Users/charlo/dev/nextjs/seekr-monorepo/backend/app/routers/ai_advisor.py`

## Notes

using something like

```python
@app.get("/someroute")
async def someFunc():
  # Defines something on the main route
```

But using routes, you can add subroutes and mount them from anywhere then you can include them in your final api like such:

```python
router = APIRouter()

@router.get("/ai/chat/history")
async def get_chat_history(...):
    ...

# then in the main app ...
app.include_router(router, prefix="/api")

```

## Depends

Let's say you have some route and you want to pass in the user or to at least check the user

```py
@router.delete("/ai/chat/history")
async def clear_chat_history(
  user: AuthUser = Depends(get_current_user)
):

# This calls get_current_user and puts it in user, if error -> route can't be called.
```

## Defining Contracts:

If you want to define a data contract you can do so through the magic of Pydantic BaseModels

```py
class ChatMessage(BaseModel):
    id: str
    content: str
    timestamp: int

@router.get("/ai/chat/message", response_model=ChatMessage)
async def get_message():
    # You can return ANY dict-like object here
    return {
        "id": "123",
        "content": "hello",
        "timestamp": 1700000000,
    }
```

And for input it works very similarly with:

```py
@router.post("/ai/chat/message")
async def get_message(input: MessageInput): # enforces MessageInput as the shape of the input
    ...
```
