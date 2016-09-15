-module(etl_tests).

-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

transform_one_value_test() ->
  Actual   = #{ 1 => [ "A" ] },
  Expected = #{ "a" => 1 },
  ?assertEqual(Expected, etl:transform(Actual)).

transform_more_values_test() ->
  Actual   = #{ 1 => [ "A", "E", "I", "O", "U" ] },
  Expected = #{ "a" => 1, "e" => 1, "i" => 1, "o" => 1, "u" => 1 },
  ?assertEqual(Expected, etl:transform(Actual)).

transform_more_keys_test() ->
  Actual   = #{
    1 => [ "A", "E" ],
    4 => [ "B" ] },
  Expected = #{
    "a" => 1,
    "b" => 4,
    "e" => 1 },
  ?assertEqual(Expected, etl:transform(Actual)).

transform_full_dataset_test() ->
  Actual = #{
    1 =>  [ "A", "E", "I", "O", "U", "L", "N", "R", "S", "T" ],
    2 =>  [ "D", "G" ],
    3 =>  [ "B", "C", "M", "P" ],
    4 =>  [ "F", "H", "V", "W", "Y" ],
    5 =>  [ "K" ],
    8 =>  [ "J", "X" ],
    10 => [ "Q", "Z" ] },
  Expected = #{
    "a" => 1, "b" => 3,  "c" => 3, "d" => 2, "e" => 1,
    "f" => 4, "g" => 2,  "h" => 4, "i" => 1, "j" => 8,
    "k" => 5, "l" => 1,  "m" => 3, "n" => 1, "o" => 1,
    "p" => 3, "q" => 10, "r" => 1, "s" => 1, "t" => 1,
    "u" => 1, "v" => 4,  "w" => 4, "x" => 8, "y" => 4,
    "z" => 10 },
  ?assertEqual(Expected, etl:transform(Actual)).

-endif.
