-module(bob_tests).

-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

responds_to_something_test() ->
  ?assertEqual("Whatever.", bob:hey("Tom-ay-to, tom-aaaah-to.")).

responds_to_shouts_test() ->
  ?assertEqual("Whoa, chill out!", bob:hey("WATCH OUT!")).

responds_to_questions_test() ->
  ?assertEqual("Sure.", bob:hey("Does this cryogenic chamber make me look fat?")).

responds_to_forceful_talking_test() ->
  ?assertEqual("Whatever.", bob:hey("Let's go make out behind the gym!")).

responds_to_acronyms_test() ->
  ?assertEqual("Whatever.", bob:hey("It's OK if you don't want to go to the DMV.")).

responds_to_forceful_questions_test() ->
  ?assertEqual("Whoa, chill out!", bob:hey("WHAT THE HELL WERE YOU THINKING?")).

responds_to_shouting_with_special_characters_test() ->
  ?assertEqual("Whoa, chill out!", bob:hey("ZOMG THE %^*@#$(*^ ZOMBIES ARE COMING!!11!!1!")).

responds_to_shouting_numbers_test() ->
  ?assertEqual("Whoa, chill out!", bob:hey("1, 2, 3, GO!")).

responds_to_shouting_with_no_exclamation_mark_test() ->
  ?assertEqual("Whoa, chill out!", bob:hey("I HATE YOU")).

responds_to_statement_containing_question_mark_test() ->
  ?assertEqual("Whatever.", bob:hey("Ending with ? means a question")).

responds_to_silence_test() ->
  ?assertEqual("Fine. Be that way!", bob:hey("")).

responds_to_prolonged_silence_test() ->
  ?assertEqual("Fine. Be that way!", bob:hey("    ")).

responds_to_non_letters_with_question_test() ->
  ?assertEqual("Sure.", bob:hey(":) ?")).

responds_to_multiple_line_questions_test() ->
  ?assertEqual("Whatever.", bob:hey("\nDoes this cryogenic chamber make me look fat? \nno")).

responds_to_other_whitespace_test() ->
  ?assertEqual("Fine. Be that way!", bob:hey("\n\r \t\v\xA0\x{2002}")).

responds_to_only_numbers_test() ->
  ?assertEqual("Whatever.", bob:hey("1, 2, 3")).

responds_to_question_with_only_numbers_test() ->
  ?assertEqual("Sure.", bob:hey("4?")).

responds_to_unicode_shout_test() ->
  ?assertEqual("Whoa, chill out!", bob:hey("\xdcML\xc4\xdcTS!")).

responds_to_unicode_non_shout_test() ->
  ?assertEqual("Whatever.", bob:hey("\xdcML\xe4\xdcTS!")).

-endif.
