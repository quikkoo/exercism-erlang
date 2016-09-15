-module(word_count).

-export([count/1]).

count(Phrase) ->
  { _, Pattern } = re:compile("[^'a-zA-Z0-9]+", [ unicode ]),
  Words = re:split(Phrase, Pattern, [ { return, list } ]),

  lists:foldl(fun(Wrd, Acc) ->
    case Wrd =/= "" of
      true ->
        Word = string:to_lower(Wrd),
        Count = maps:get(Word, Acc, 0) + 1,
        maps:put(Word, Count, Acc);
      false -> Acc
    end
  end, maps:new(), Words).
