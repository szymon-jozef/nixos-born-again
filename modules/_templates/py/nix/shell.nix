{ metadata, ... }:
{
  perSystem =
    {
      pkgs,
      pythonSet,
      workspace,
      ...
    }:
    {

      devenv.shells.default = {
        packages = with pkgs; [
          (pythonSet.mkVirtualEnv "${metadata.project.name}-dev-env" workspace.deps.all)
          uv
        ];

        env = {
          UV_NO_SYNC = "1";
          UV_PYTHON = pythonSet.python.interpreter;
          UV_PYTHON_DOWNLOADS = "never";
        };

        enterShell = ''
          unset PYTHONPATH
          export REPO_ROOT=$(git rev-parse --show-toplevel)
        '';
      };
    };
}
