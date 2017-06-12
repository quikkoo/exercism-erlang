-module(word_count).

-export([calculate/1]).

calculate(Phrase) ->
  { _, Pattern } = re:compile("[']?[^'a-zA-Z0-9]+[']?", [ unicode ]),
  Words = re:split(string:to_lower(Phrase), Pattern, [ { return, list } ]),

  lists:foldl(fun(Word, Acc) ->
    case Word =/= "" of
      true ->
        Count = maps:get(Word, Acc, 0) + 1,
        maps:put(Word, Count, Acc);
      false -> Acc
    end
  end, maps:new(), Words).