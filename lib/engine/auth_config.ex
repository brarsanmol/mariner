defmodule Engine.AuthConfig do
  @moduledoc """
  Provides struct and type for a AuthConfig
  """

  @type t :: %__MODULE__{
          email: String.t() | nil,
          password: String.t() | nil,
          serveraddress: String.t() | nil,
          username: String.t() | nil
        }

  defstruct [:email, :password, :serveraddress, :username]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      email: {:string, :generic},
      password: {:string, :generic},
      serveraddress: {:string, :generic},
      username: {:string, :generic}
    ]
  end
end
