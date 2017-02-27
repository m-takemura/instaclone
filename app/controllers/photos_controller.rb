class PhotosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_photo, only:[:edit, :update, :destroy]

  def index
    @photos=Photo.order("created_at desc")
    if params[:back]
      @photo=Photo.new(photos_params)
    else
      @photo=Photo.new
    end
  end

  def create
    @photo=Photo.new(photos_params)
    @photo.user_id=current_user.id
    if @photo.save
      redirect_to photos_path, notice:"写真を投稿しました！"
    else
      render 'edit'
    end
  end

  def edit
  end

  def update
    if @photo.update(photos_params)
      redirect_to photos_path, notice:'投稿を更新しました！'
    else
      render 'edit'
    end
  end

  def destroy
    @photo.destroy
    redirect_to photos_path, notice:'投稿を削除しました！'
  end

  private
    def photos_params
      params.require(:photo).permit(:content, :picture)
    end

    #idをキーとしてレコードを取得する
    def set_photo
      @photo=Photo.find(params[:id])
    end
end
