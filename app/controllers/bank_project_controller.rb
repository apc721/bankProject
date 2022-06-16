class BankProjectController < ApplicationController
  protect_from_forgery with: :null_session
  def index
    puts "-------------- In Index --------------"
    @allBankers = Bank.all
    puts "# of Bankers = #{@allBankers.size}"
    @allBankers = @allBankers.sort_by {|banker| [-banker.banker,-banker.amount]}
  end

  def deposit
    puts "-------------- In Deposit --------------"
    banker = params[:bankerInput]
    amount = params[:amountInput].to_f
    if @row = Bank.find_by(banker: banker)
      @row.amount += amount
    else
      map = {"banker" => banker, "amount" => amount}
      @row = Bank.new(map)
    end
    respond_to do |format|
      if @row.save
        BankerMailer.with(row: @row).deposit_email.deliver_later
        puts "Success!"
        format.html{redirect_to bank_project_url}
      else
        format.html{redirect_to '/'}
      end
    end
  end

  def withdraw
    puts "-------------- In Withdraw --------------"
    banker = params[:bankerInput]
    amount = params[:amountInput].to_f
    if row = Bank.find_by(banker: banker)
      row.amount -= amount
    else
      map = {"banker" => banker, "amount" => amount}
      row = Bank.new(map)
    end
    respond_to do |format|
      if row.save
        BankerMailer.with(banker: banker).withdraw_email.deliver_later
        puts "Success!"
        format.html{redirect_to bank_project_url}
      else
        format.html{redirect_to '/'}
      end
    end
  end

  def handlePost
    if params[:commit] == "Deposit"
      deposit
    elsif params[:commit] == "Withdraw"
      withdraw
    end
  end
end
