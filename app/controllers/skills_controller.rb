class SkillsController < ApplicationController
  before_action :set_skill, only: [:edit, :update, :destroy]
  before_action :set_resume

  def new
    @skill = Skill.new
  end

  def create
    @skill = Skill.new(skill_params)
    @skill.resume_id = @resume.id

    if @skill.save
      flash[:notice] = "Your skill was added"
      redirect_to edit_resume_path(@resume)
    else
      render 'skills/edit'
    end
  end

  def edit; end

  def update
    if @skill.update(skill_params)
      flash[:notice] = "Your skill was updated"
      redirect_to edit_resume_path(@resume)
    else
      render 'skills/edit'
    end
  end

  def destroy
    @skill.destroy
    flash[:notice] = "Skill was deleted"
    redirect_to edit_resume_path(@resume)
  end

  private

  def set_skill
    @skill = Skill.find(params[:id])
  end

  def set_resume
    @resume = Resume.find(params[:resume_id])
  end

  def skill_params
    params.require(:skill).permit(:title,:description)
  end
end it
