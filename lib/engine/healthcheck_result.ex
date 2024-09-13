defmodule Engine.HealthcheckResult do
  @moduledoc """
  Provides struct and type for a HealthcheckResult
  """

  @type t :: %__MODULE__{
          End: String.t() | nil,
          ExitCode: integer | nil,
          Output: String.t() | nil,
          Start: DateTime.t() | nil
        }

  defstruct [:End, :ExitCode, :Output, :Start]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      End: {:string, :generic},
      ExitCode: :integer,
      Output: {:string, :generic},
      Start: {:string, :date_time}
    ]
  end
end
