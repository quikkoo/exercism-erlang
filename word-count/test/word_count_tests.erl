-module(word_count_tests).

-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

should_count_one_word_test() ->
  Phrase = "word",
  Counts = #{ "word" => 1 },
  ?assertEqual(Counts, word_count:calculate(Phrase)).

should_count_one_of_each_test() ->
  Phrase = "one of each",
  Counts = #{
    "one" => 1,
    "of" => 1,
    "each" => 1
  },
  ?assertEqual(Counts, word_count:calculate(Phrase)).

should_count_multiple_occurrences_test() ->
  Phrase = "one fish two fish red fish blue fish",
  Counts = #{
    "one" => 1,
    "two" => 1,
    "fish" => 4,
    "red" => 1,
    "blue" => 1
  },
  ?assertEqual(Counts, word_count:calculate(Phrase)).

should_count_everything_just_once_test() ->
  Phrase = "all the kings horses and all the kings men",
  Counts = #{
    "all" => 2,
    "the" => 2,
    "kings" => 2,
    "horses" => 1,
    "and" => 1,
    "men" => 1
  },
  ?assertEqual(Counts, word_count:calculate(Phrase)).

should_ignore_punctuation_test() ->
  Phrase = "car : carpet as java : javascript!!&@$%^&",
  Counts = #{
    "car" => 1,
    "carpet" => 1,
    "as" => 1,
    "java" => 1,
    "javascript" => 1
  },
  ?assertEqual(Counts, word_count:calculate(Phrase)).

should_handle_cramped_lists_test() ->
  Phrase = "one,two,three",
  Counts = #{
    "one" => 1,
    "two" => 1,
    "three" => 1
  },
  ?assertEqual(Counts, word_count:calculate(Phrase)).

should_include_numbers_test() ->
  Phrase = "testing, 1, 2 testing",
  Counts = #{
    "testing" => 2,
    "1" => 1,
    "2" => 1
  },
  ?assertEqual(Counts, word_count:calculate(Phrase)).

should_normalize_case_test() ->
  Phrase = "go Go GO",
  Counts = #{ "go" => 3 },
  ?assertEqual(Counts, word_count:calculate(Phrase)).

should_allow_apostrophes_test() ->
  Phrase = "First: don't laugh. Then: don't cry.",
  Counts = #{
    "first" => 1,
    "don't" => 2,
    "laugh" => 1,
    "then" => 1,
    "cry" => 1
  },
  ?assertEqual(Counts, word_count:calculate(Phrase)).

should_treat_symbols_as_separators_test() ->
  Phrase = "hey,my_spacebar_is_broken.",
  Counts = #{
    "hey" => 1,
    "my" => 1,
    "spacebar" => 1,
    "is" => 1,
    "broken" => 1
  },
  ?assertEqual(Counts, word_count:calculate(Phrase)).

should_counts_words_with_quotations_test() ->
  Phrase = "Joe can't tell between 'large' and large.",
  Counts = #{
    "joe" => 1,
    "can't" => 1,
    "tell" => 1,
    "between" => 1,
    "large" => 2,
    "and" => 1
  },
  ?assertEqual(Counts, word_count:calculate(Phrase)).

-endif.
