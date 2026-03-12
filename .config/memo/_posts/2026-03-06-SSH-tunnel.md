# SSH tunnel

You can use SSH to create tunnels between servers. Let's say you have a db on port `5432` of `server`. You want to be able to access it but it's not available on the internet. What you can do if you're able to ssh into the server is something like:

```bash
ssh -L 5432:localhost:5432 user@server
```

Where localhost is from the perspective of the target machine
