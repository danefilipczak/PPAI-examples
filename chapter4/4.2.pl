A planning program for a robot. Suitable for asking the robot to put a ball into the trash. 

the state of the world is defined by state(robot_location, trash_can_location, ball)

actions are defined as action(state, type, new_state)

defining actions that map states to new states is all we need to produce some pretty interesting behavior.

% we qualify the location of the ball with floor() in order to prevent matching P1 with floor.
% our robot cannot fall onto the floor!!!

action(state(P1, P2, floor(P1)),
	pickup,
	state(P1, P2, held)).

action(state(P, P, held),
	drop,
	state(P, P, in_basket)).

action(state(P, P, P1), 
	push(P, NewP),
	state(NewP, NewP, P1)).

action(state(P1, P2, L),
	go(P1, NewP),
	state(NewP, P2, L)).

% a plan maps a state to a new state. 

plan(State, State, []).

plan(State, Goal, [A1 | More]) :-
	action(State, A1, NewState),
	plan(NewState, Goal, More).
