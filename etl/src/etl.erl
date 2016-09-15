-module(etl).

-export([transform/1]).

transform(Data) ->
  maps:fold(fun(Key, Values, Acc) ->
    Tuples = lists:map(fun(Value) ->
      { string:to_lower(Value), Key }
    end, Values),
    maps:merge(Acc, maps:from_list(Tuples))
  end, maps:new(), Data).
