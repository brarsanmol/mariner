defmodule Engine.MountBindOptions do
  @moduledoc """
  Provides struct and type for a MountBindOptions
  """

  @type t :: %__MODULE__{
          CreateMountpoint: boolean | nil,
          NonRecursive: boolean | nil,
          Propagation: String.t() | nil,
          ReadOnlyForceRecursive: boolean | nil,
          ReadOnlyNonRecursive: boolean | nil
        }

  defstruct [
    :CreateMountpoint,
    :NonRecursive,
    :Propagation,
    :ReadOnlyForceRecursive,
    :ReadOnlyNonRecursive
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      CreateMountpoint: :boolean,
      NonRecursive: :boolean,
      Propagation: {:enum, ["private", "rprivate", "shared", "rshared", "slave", "rslave"]},
      ReadOnlyForceRecursive: :boolean,
      ReadOnlyNonRecursive: :boolean
    ]
  end
end
