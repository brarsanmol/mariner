defmodule Engine.SystemVersion do
  @moduledoc """
  Provides struct and type for a SystemVersion
  """

  @type t :: %__MODULE__{
          ApiVersion: String.t() | nil,
          Arch: String.t() | nil,
          BuildTime: String.t() | nil,
          Components: [Engine.SystemVersionComponents.t()] | nil,
          Experimental: boolean | nil,
          GitCommit: String.t() | nil,
          GoVersion: String.t() | nil,
          KernelVersion: String.t() | nil,
          MinAPIVersion: String.t() | nil,
          Os: String.t() | nil,
          Platform: Engine.SystemVersionPlatform.t() | nil,
          Version: String.t() | nil
        }

  defstruct [
    :ApiVersion,
    :Arch,
    :BuildTime,
    :Components,
    :Experimental,
    :GitCommit,
    :GoVersion,
    :KernelVersion,
    :MinAPIVersion,
    :Os,
    :Platform,
    :Version
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      ApiVersion: {:string, :generic},
      Arch: {:string, :generic},
      BuildTime: {:string, :generic},
      Components: [{Engine.SystemVersionComponents, :t}],
      Experimental: :boolean,
      GitCommit: {:string, :generic},
      GoVersion: {:string, :generic},
      KernelVersion: {:string, :generic},
      MinAPIVersion: {:string, :generic},
      Os: {:string, :generic},
      Platform: {Engine.SystemVersionPlatform, :t},
      Version: {:string, :generic}
    ]
  end
end
