defmodule Engine.ProcessConfig do
  @moduledoc """
  Provides struct and type for a ProcessConfig
  """

  @type t :: %__MODULE__{
          arguments: [String.t()] | nil,
          entrypoint: String.t() | nil,
          privileged: boolean | nil,
          tty: boolean | nil,
          user: String.t() | nil
        }

  defstruct [:arguments, :entrypoint, :privileged, :tty, :user]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      arguments: [string: :generic],
      entrypoint: {:string, :generic},
      privileged: :boolean,
      tty: :boolean,
      user: {:string, :generic}
    ]
  end
end
