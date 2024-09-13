defmodule Engine.TaskSpecRestartPolicy do
  @moduledoc """
  Provides struct and type for a TaskSpecRestartPolicy
  """

  @type t :: %__MODULE__{
          Condition: String.t() | nil,
          Delay: integer | nil,
          MaxAttempts: integer | nil,
          Window: integer | nil
        }

  defstruct [:Condition, :Delay, :MaxAttempts, :Window]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      Condition: {:enum, ["none", "on-failure", "any"]},
      Delay: :integer,
      MaxAttempts: :integer,
      Window: :integer
    ]
  end
end
