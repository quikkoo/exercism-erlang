-module(hello_world_tests).

-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

without_name_test() ->
  ?assertEqual("Hello, World!", hello_world:greet()).

with_empty_name_test() ->
  ?assertEqual("Hello, World!", hello_world:greet("")).

with_name_erlang_test() ->
  ?assertEqual("Hello, Erlang!", hello_world:greet("Erlang")).

with_name_exercism_test() ->
  ?assertEqual("Hello, Exercism!", hello_world:greet("Exercism")).

-endif.
