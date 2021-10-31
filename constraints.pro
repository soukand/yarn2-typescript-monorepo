isApplication(WorkspaceDir) :-
    sub_atom(WorkspaceDir, 0, _, _, 'applications/').

isPackage(WorkspaceDir) :-
    sub_atom(WorkspaceDir, 0, _, _, 'packages/').

isRoot(WorkspaceDir) :-
    WorkspaceDir = '.'.

isWorkspace(WorkspaceDir) :-
    \+ WorkspaceDir = '.'.

% RULE: typescript is a dev dependency with version '4.4.4'
gen_enforced_dependency(WorkspaceCwd, 'typescript', '4.4.4', devDependencies) :-
    workspace_has_dependency(WorkspaceCwd, 'typescript', _, _).
%

% RULE: typescript is a dev dependency with version '7.32.0'
gen_enforced_dependency(WorkspaceCwd, 'eslint', '7.32.0', devDependencies) :-
    workspace_has_dependency(WorkspaceCwd, 'eslint', _, _).

% RULE: packages should have named `@app/{packageName}`
gen_enforced_field(WorkspaceCwd, 'name', PackageName) :-
    isPackage(WorkspaceCwd),
    atom_length(WorkspaceCwd, Length),
    PackageNameLength is Length - 9,
    sub_atom(WorkspaceCwd, 9, PackageNameLength, _, Package),
    atom_concat('@app/', Package, PackageName).

% RULE: workspaces should have script: `build`
gen_enforced_field(WorkspaceCwd, 'scripts.build', 'value missing') :-
    isApplication(WorkspaceCwd),
    \+ workspace_field(WorkspaceCwd, 'scripts.build', _).

% RULE: workspaces should have script: `check`
gen_enforced_field(WorkspaceCwd, 'scripts.check', 'value missing') :-
    isWorkspace(WorkspaceCwd),
    \+ workspace_field(WorkspaceCwd, 'scripts.check', _).

% RULE: applications should have script: `start`
gen_enforced_field(WorkspaceCwd, 'scripts.start', 'value missing') :-
    isApplication(WorkspaceCwd),
    \+ workspace_field(WorkspaceCwd, 'scripts.start', _).

% RULE: applications should have script: `start-dev`
gen_enforced_field(WorkspaceCwd, 'scripts.start-dev', 'value missing') :-
    isApplication(WorkspaceCwd),
    \+ workspace_field(WorkspaceCwd, 'scripts.start-dev', _).
