defmodule Engine.TaskSpecContainerSpecPrivileges do
  @moduledoc """
  Provides struct and type for a TaskSpecContainerSpecPrivileges
  """

  @type t :: %__MODULE__{
          AppArmor: Engine.TaskSpecContainerSpecPrivilegesAppArmor.t() | nil,
          CredentialSpec: Engine.TaskSpecContainerSpecPrivilegesCredentialSpec.t() | nil,
          NoNewPrivileges: boolean | nil,
          SELinuxContext: Engine.TaskSpecContainerSpecPrivilegesSELinuxContext.t() | nil,
          Seccomp: Engine.TaskSpecContainerSpecPrivilegesSeccomp.t() | nil
        }

  defstruct [:AppArmor, :CredentialSpec, :NoNewPrivileges, :SELinuxContext, :Seccomp]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      AppArmor: {Engine.TaskSpecContainerSpecPrivilegesAppArmor, :t},
      CredentialSpec: {Engine.TaskSpecContainerSpecPrivilegesCredentialSpec, :t},
      NoNewPrivileges: :boolean,
      SELinuxContext: {Engine.TaskSpecContainerSpecPrivilegesSELinuxContext, :t},
      Seccomp: {Engine.TaskSpecContainerSpecPrivilegesSeccomp, :t}
    ]
  end
end
