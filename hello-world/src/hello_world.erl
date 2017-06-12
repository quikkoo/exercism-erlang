-module(hello_world).

-export([greet/0, greet/1]).

greet() ->
  "Hello, World!".

greet("") ->
  "Hello, World!";
greet(Name) ->
  lists:flatten(io_lib:format("Hello, ~s!", [Name])).
