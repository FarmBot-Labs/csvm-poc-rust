defmodule Csvm do
  use Rustler, otp_app: :csvm, crate: :csvm

  def add(_a, _b), do: :erlang.nif_error("Nif not loaded")
end
