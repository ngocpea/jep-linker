require 'rails_helper'

RSpec.describe "LinksController routing" do
  it "should route GET / to links#index" do
    expect(:get => '/').to route_to(
      :controller => 'links',
      :action => 'index'
    )
  end

  it "should route POST /links to links#create" do
    expect(:post => '/links').to route_to(
      :controller => 'links',
      :action => 'create'
    )
  end

  it "should route GET /links/1 to links#show" do
    expect(:get => '/links/1').to route_to(
      :controller => 'links',
      :action => 'show',
      :id => '1'
    )
  end
end
