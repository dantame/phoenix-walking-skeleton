defmodule WalkingSkeletonWeb.PageController do
  use WalkingSkeletonWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
