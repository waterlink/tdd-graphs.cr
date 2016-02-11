Hello. I am Oleksii Fedorov and I am wearing a hat of That TDD Fellow. That
means you are watching TDD Screencast episode #4.

As mentioned in the previous episode, today we are going to implement a path
finding algorithm.

Specifically, our first problem in a path finding theme will be the following:

- We are given a directional graph, that consists of nodes and edges between
  them.
- We are given two nodes: start and finish.
- We need to answer such questions:
  - Is there a path from start to finish?
  - If there is, What this path is?

I need to make a remark, that we clearly dont have to return the shortest path,
just any path, that we can find. We will tackle shortest path problem in later
episodes.

Now, I think we can start.

```
./watch.sh
vim         # coding session
```

This was pretty easy to make a DFS algorithm to emerge on its own, by driving
it with the specification. Lets see if it is possible to do the same with
shortest path problem.. Next time, on the TDD Screencast. Have a nice day.
