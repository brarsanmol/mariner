defmodule Engine.OCIPlatform do
  @moduledoc """
  Provides struct and type for a OCIPlatform
  """

  @type t :: %__MODULE__{
          architecture: String.t() | nil,
          os: String.t() | nil,
          "os.features": [String.t()] | nil,
          "os.version": String.t() | nil,
          variant: String.t() | nil
        }

  defstruct [:architecture, :os, :"os.features", :"os.version", :variant]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      architecture: {:string, :generic},
      os: {:string, :generic},
      "os.features": [string: :generic],
      "os.version": {:string, :generic},
      variant: {:string, :generic}
    ]
  end
end
