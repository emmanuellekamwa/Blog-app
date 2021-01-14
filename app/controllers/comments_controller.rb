class CommentsController < ApplicationController
    before_filter :require_login, except: [:create]
end
