-module(anagram_tests).

-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

should_detect_no_matches_test() ->
  ?assertEqual(
    [],
    anagram:matches("diaper", ["hello", "world", "zombies", "pants"])).

should_detect_simple_anagram_test() ->
  ?assertEqual(
    ["tan"],
    anagram:matches("ant", ["tan", "stand", "at"])).

should_detect_multiple_anagrams_test() ->
  ?assertEqual(
    ["stream", "maters"],
    anagram:matches("master", ["stream", "pigeon", "maters"])).

should_not_confuse_different_duplicates_test() ->
  ?assertEqual(
    [],
    anagram:matches("galea", ["eagle"])).

should_not_include_identical_words_test() ->
  ?assertEqual(
    ["cron"],
    anagram:matches("corn", ["corn", "dark", "Corn", "rank", "CORN", "cron", "park"])).

should_eliminate_anagram_subsets_test() ->
  ?assertEqual(
    [],
    anagram:matches("good", ["dog", "goody"])).

should_eliminate_anagram_with_same_checksum_test() ->
  ?assertEqual(
    [],
    anagram:matches("mass", ["last"])).

should_detect_anagram_test() ->
  ?assertEqual(
    ["inlets"],
    anagram:matches("listen", ["enlists", "google", "inlets", "banana"])).

should_detect_more_multiple_anagrams_test() ->
  ?assertEqual(
    ["gallery", "regally", "largely"],
    anagram:matches("allergy", ["gallery", "ballerina", "regally", "clergy", "largely", "leading"])).

should_treat_subject_anagrams_as_case_insensitive_test() ->
  ?assertEqual(
    ["carthorse"],
    anagram:matches("Orchestra", ["cashregister", "carthorse", "radishes"])).

should_treat_candidate_anagrams_as_case_insensitive_test() ->
  ?assertEqual(
    ["Carthorse"],
    anagram:matches("orchestra", ["Cashregister", "Carthorse", "Radishes"])).

-endif.
