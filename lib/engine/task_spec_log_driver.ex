defmodule Engine.TaskSpecLogDriver do
  @moduledoc """
  Provides struct and type for a TaskSpecLogDriver
  """

  @type t :: %__MODULE__{
          Name: String.t() | nil,
          Options: Engine.TaskSpecLogDriverOptions.t() | nil
        }

  defstruct [:Name, :Options]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [Name: {:string, :generic}, Options: {Engine.TaskSpecLogDriverOptions, :t}]
  end
end
