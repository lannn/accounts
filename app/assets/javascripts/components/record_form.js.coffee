@RecordForm = React.createClass
  getInitialState: ->
    title: ""
    date: ""
    amount: ""
  handleChange: (e) ->
    name = e.target.name
    @setState "#{ name }": e.target.value
  valid: ->
    @state.title && @state.date && @state.amount
  handleSubmit: (e) ->
    e.preventDefault()
    $.post "", { record: @state }, (data) =>
      @props.handleRecord data
      @setState @getInitialState()
    , "JSON"
  render: ->
    React.DOM.form
      className: "form-inline"
      onSubmit: @handleSubmit
      React.DOM.div
        className: "form-group"
        React.DOM.input
          type: "text"
          className: "form-control"
          placeholder: "Date"
          name: "date"
          value: @state.date
          onChange: @handleChange
      React.DOM.button
        type: "submit"
        className: "btn btn-primary"
        disable: !@valid()
        "Create record"
