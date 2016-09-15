-module(bob).

-export([hey/1]).

regex(Name, RegEx) ->
  { _, Pattern } = re:compile(RegEx, [ unicode ]),
  { Name, Pattern }.

match(_, []) ->
  false;
match(Question, [ { Name, Pattern } | List ]) ->
  case re:run(Question, Pattern) of
    { match, _ } -> Name;
    _ -> match(Question, List)
  end.

hey(Question) ->
  Fine = regex(fine, "^[\\s\\v\\x{00A0}\\x{2002}]*$"),
  Whoa = regex(whoa, "^[^\\p{Ll}]*[A-Z][^\\p{Ll}]*$"),
  Sure = regex(sure, "^.*\\?[\\s\\v]*$"),

  case match(Question, [ Fine, Whoa, Sure ]) of
    fine -> "Fine. Be that way!";
    whoa -> "Whoa, chill out!";
    sure -> "Sure.";
    _ -> "Whatever."
  end.
