class Public::UserGroupsController < ApplicationController

  has_many :users
  has_many :groups

end
