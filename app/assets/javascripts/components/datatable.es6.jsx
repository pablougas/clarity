var Datatable = React.createClass({

    componentDidMount() {

        $('#datatable1').dataTable({
            'paging':   true,  // Table pagination
            'ordering': true,  // Column ordering
            'info':     true,  // Bottom left status text
            'responsive': true, // https://datatables.net/extensions/responsive/examples/
            // Text translation options
            // Note the required keywords between underscores (e.g _MENU_)
            oLanguage: {
                sSearch:      'Search all columns:',
                sLengthMenu:  '_MENU_ records per page',
                info:         'Showing page _PAGE_ of _PAGES_',
                zeroRecords:  'Nothing found - sorry',
                infoEmpty:    'No records available',
                infoFiltered: '(filtered from _MAX_ total records)'
            },
            // Datatable Buttons setup
            dom: '<"html5buttons"B>lTfgitp',
            buttons: [
                {extend: 'copy',  className: 'btn-sm' },
                {extend: 'csv',   className: 'btn-sm' },
                {extend: 'excel', className: 'btn-sm', title: 'XLS-File'},
                {extend: 'pdf',   className: 'btn-sm', title: $('title').text() },
                {extend: 'print', className: 'btn-sm' }
            ]
        });
    },

    handleClick(e){
        var itemID = e.target.parentNode.id;
        window.location.href = '/claims/' + itemID
    },
    componentWillUnmount() {
        var destroy = {destroy: true};
        $('#datatable1').dataTable(destroy);
    },
    propTypes: {
        claims: React.PropTypes.node
    },

    render: function() {
        var createItem = (p) => (
                <tr id={p.id} key={p.id} onClick={this.handleClick}>
                    <td>{p.number}</td>
                    <td>{p.street_one}</td>
                    <td>{p.city}</td>
                    <td>{p.state}</td>
                    <td>{p.zip}</td>
                </tr>
        );

        return (
        <div className="row">
           <div className="col-lg-12">
              <div className="panel panel-default">
                 <div className="panel-heading">
                    Data Tables |
                    <small>Zero Configuration</small>
                 </div>
                 <div className="panel-body">
                    <table id="datatable1" className="table table-striped table-hover">
                       <thead>
                          <tr>
                             <th>Policy Number</th>
                             <th>Street</th>
                             <th>City</th>
                             <th className="sort-numeric">State</th>
                             <th className="sort-alpha">Zip</th>
                          </tr>
                       </thead>
                       <tbody>
                            {this.props.policies.map(createItem)}
                       </tbody>
                    </table>
                 </div>
              </div>
           </div>
        </div>
        );
    }

});
