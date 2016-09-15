-module(anagram_tests).

-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

detect_no_matches_test() ->
  ?assertEqual(
    [],
    anagram:matches("diaper", ["hello", "world", "zombies", "pants"])).

detect_simple_anagrams_test() ->
  ?assertEqual(
    ["tan"],
    anagram:matches("ant", ["tan", "stand", "at"])).

detect_multiple_anagrams_test() ->
  ?assertEqual(
    ["stream", "maters"],
    anagram:matches("master", ["stream", "pigeon", "maters"])).

does_not_confuse_different_duplicates_test() ->
  ?assertEqual(
    [],
    anagram:matches("galea", ["eagle"])).

does_not_include_identical_words_test() ->
  ?assertEqual(
    ["cron"],
    anagram:matches("corn", ["corn", "dark", "Corn", "rank", "CORN", "cron", "park"])).

eliminate_anagram_with_same_checksum_test() ->
  ?assertEqual(
    [],
    anagram:matches("mass", ["last"])).

eliminate_anagram_subsets_test() ->
  ?assertEqual(
    [],
    anagram:matches("good", ["dog", "goody"])).

detect_anagram_test() ->
  ?assertEqual(
    ["inlets"],
    anagram:matches("listen", ["enlists", "google", "inlets", "banana"])).

detect_more_anagrams_test() ->
  ?assertEqual(
    ["gallery", "regally", "largely"],
    anagram:matches("allergy", ["gallery", "ballerina", "regally", "clergy", "largely", "leading"])).

treat_subject_anagrams_as_case_insensitive_test() ->
  ?assertEqual(
    ["carthorse"],
    anagram:matches("Orchestra", ["cashregister", "carthorse", "radishes"])).

treat_candidate_anagrams_as_case_insensitive_test() ->
  ?assertEqual(
    ["Carthorse"],
    anagram:matches("orchestra", ["Cashregister", "Carthorse", "Radishes"])).

-endif.
