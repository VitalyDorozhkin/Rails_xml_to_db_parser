class BatchController < ApplicationController

  def new
    @batch = Batch.new
  end

  def create
    @batch = Batch.new
    if !params[:file] || params[:file].content_type != 'text/xml'
      flash['message'] = 'Please, attach xml file'
      render('new') && return
    end
    root = Hash.from_xml(IO.read(params[:file]))['Root']

    @batch.guid = root['FileAttribute']['GUID']
    @batch.date = root['FileData']['Batch']['CreationDate']
    @batch.id = root['FileData']['Batch']['BatchID']

    root['FileData']['Invoice'].each do |invoice|
      inv = @batch.invoices.new(
          operation_number: invoice['InvoiceOperation']['InvoiceOperationNumber'],
          operation_date: invoice['InvoiceOperation']['InvoiceOperationDate'],
          company: Company.find_by(code: invoice['InvoiceOperation']['CompanyCode'])
        )

      unless invoice['InvoiceData'].is_a? Array
        invoice['InvoiceData'] = [invoice['InvoiceData']]
      end

      invoice['InvoiceData'].each do |data|
        inv.positions.new(
            quantity: data['ItemQty'], 
            price: data['ParcelPrice'], 
            parcel: Parcel.find_by(code: data['ParcelCode'])
          )
      end
    end

    @batch.save
    flash['message'] = 'success' unless @batch.errors.any?
    render 'new'
  end
end
