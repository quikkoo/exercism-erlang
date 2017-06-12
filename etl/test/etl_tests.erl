-module(etl_tests).

-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

should_transform_one_value_test() ->
  Actual   = #{ 1 => [ "WORLD" ] },
  Expected = #{ "world" => 1 },
  ?assertEqual(Expected, etl:transform(Actual)).

should_transform_more_values_test() ->
  Actual   = #{ 1 => [ "WORLD", "GSCHOOLERS" ] },
  Expected = #{
    "world" => 1,
    "gschoolers" => 1
  },
  ?assertEqual(Expected, etl:transform(Actual)).

should_transform_more_keys_test() ->
  Actual   = #{
    1 => [ "APPLE", "ARTICHOKE" ],
    2 => [ "BOAT", "BALLERINA" ] },
  Expected = #{
    "apple" => 1,
    "artichoke" => 1,
    "boat" => 2,
    "ballerina" => 2
  },
  ?assertEqual(Expected, etl:transform(Actual)).

should_transform_full_dataset_test() ->
  Actual = #{
    1 =>  [ "A", "E", "I", "O", "U", "L", "N", "R", "S", "T" ],
    2 =>  [ "D", "G" ],
    3 =>  [ "B", "C", "M", "P" ],
    4 =>  [ "F", "H", "V", "W", "Y" ],
    5 =>  [ "K" ],
    8 =>  [ "J", "X" ],
    10 => [ "Q", "Z" ] },
  Expected = #{
    "a" => 1, "b" =>  3, "c" => 3, "d" => 2, "e" => 1,
    "f" => 4, "g" =>  2, "h" => 4, "i" => 1, "j" => 8,
    "k" => 5, "l" =>  1, "m" => 3, "n" => 1, "o" => 1,
    "p" => 3, "q" => 10, "r" => 1, "s" => 1, "t" => 1,
    "u" => 1, "v" =>  4, "w" => 4, "x" => 8, "y" => 4,
    "z" => 10
  },
  ?assertEqual(Expected, etl:transform(Actual)).

-endif.
