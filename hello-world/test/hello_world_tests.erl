-module(hello_world_tests).

-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

without_name_test() ->
  ?assertEqual("Hello, World!", hello_world:greet()).

with_empty_name_test() ->
  ?assertEqual("Hello, !", hello_world:greet("")).

with_name_alice_test() ->
  ?assertEqual("Hello, Alice!", hello_world:greet("Alice")).

-endif.
