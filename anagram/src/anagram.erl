-module(anagram).

-export([matches/2]).

is_same(Lhs, Rhs) ->
  string:equal(Lhs, Rhs).

has_same_size(Lhs, Rhs) ->
  string:len(Lhs) =:= string:len(Rhs).

has_same_elements(Lhs, Rhs) ->
  Lhs =:= Rhs.

matches(Subject, Candidates) ->
  LSub = string:to_lower(Subject),
  SSub = lists:sort(LSub),

  lists:filter(fun(Candidate) ->
    LCan = string:to_lower(Candidate),
    SCan = lists:sort(LCan),

    has_same_size(LSub, LCan) and not is_same(LSub, LCan) and has_same_elements(SSub, SCan)
  end, Candidates).
