defmodule WalkingSkeleton.Repo do
  use Ecto.Repo,
    otp_app: :walking_skeleton,
    adapter: Ecto.Adapters.Postgres
end
