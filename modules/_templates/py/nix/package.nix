{
  metadata,
  ...
}:
{
  perSystem = { pythonSet, workspace, ... }: {
    packages.default = pythonSet.mkVirtualEnv "${metadata.project.name}-env" workspace.deps.default;
  };
}
