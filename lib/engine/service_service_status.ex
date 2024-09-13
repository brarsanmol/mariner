defmodule Engine.ServiceServiceStatus do
  @moduledoc """
  Provides struct and type for a ServiceServiceStatus
  """

  @type t :: %__MODULE__{
          CompletedTasks: integer | nil,
          DesiredTasks: integer | nil,
          RunningTasks: integer | nil
        }

  defstruct [:CompletedTasks, :DesiredTasks, :RunningTasks]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [CompletedTasks: :integer, DesiredTasks: :integer, RunningTasks: :integer]
  end
end
