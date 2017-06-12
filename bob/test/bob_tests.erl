-module(bob_tests).

-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

should_respond_to_a_statement_test() ->
  ?assertEqual("Whatever.", bob:hey("Tom-ay-to, tom-aaaah-to.")).

should_respond_to_shouting_test() ->
  ?assertEqual("Whoa, chill out!", bob:hey("WATCH OUT!")).

should_respond_to_questions_test() ->
  ?assertEqual("Sure.", bob:hey("Does this cryogenic chamber make me look fat?")).

should_respond_to_questions_ending_with_numbers_test() ->
  ?assertEqual("Sure.", bob:hey("You are, what, like 15?")).

should_respond_to_forceful_talking_test() ->
  ?assertEqual("Whatever.", bob:hey("Let's go make out behind the gym!")).

should_respond_to_acronyms_in_regular_speech_test() ->
  ?assertEqual("Whatever.", bob:hey("It's OK if you don't want to go to the DMV.")).

should_respond_to_forceful_questions_as_shouting_test() ->
  ?assertEqual("Whoa, chill out!", bob:hey("WHAT THE HELL WERE YOU THINKING?")).

should_respond_to_shouting_with_special_characters_test() ->
  ?assertEqual("Whoa, chill out!", bob:hey("ZOMG THE %^*@#$(*^ ZOMBIES ARE COMING!!11!!1!")).

should_respond_to_numbers_when_shouting_test() ->
  ?assertEqual("Whoa, chill out!", bob:hey("1, 2, 3, GO!")).

should_respond_to_numbers_as_speech_test() ->
  ?assertEqual("Whatever.", bob:hey("1, 2, 3")).

should_respond_to_questions_with_only_numbers_test() ->
  ?assertEqual("Sure.", bob:hey("4?")).

should_respond_to_shouting_with_no_exclamation_mark_test() ->
  ?assertEqual("Whoa, chill out!", bob:hey("I HATE YOU")).

should_respond_to_statement_containing_question_mark_test() ->
  ?assertEqual("Whatever.", bob:hey("Ending with ? means a question")).

should_respond_to_prattling_on_test() ->
  ?assertEqual("Sure.", bob:hey("Wait! Hang on. Are you going to be OK?")).

should_respond_to_silence_test() ->
  ?assertEqual("Fine. Be that way!", bob:hey("")).

should_respond_to_prolonged_silence_test() ->
  ?assertEqual("Fine. Be that way!", bob:hey("          ")).

should_respond_to_others_blank_characters_test() ->
  ?assertEqual("Fine. Be that way!", bob:hey("\n\r \t\v\x00A0\x2002")).

should_respond_to_multiple_line_questions_test() ->
  ?assertEqual("Whatever.", bob:hey("\nDoes this cryogenic chamber make me look fat?\nno")).

should_respond_to_non_letters_with_question_test() ->
  ?assertEqual("Sure.", bob:hey(":) ?")).

-endif.
