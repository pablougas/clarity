var ActiveList = React.createClass({
    componentDidMount() {
        $('[data-check-all]').on('change', function() {
            var $this = $(this),
            index = $this.index() + 1,
            checkbox = $this.find('input[type="checkbox"]'),
            table = $this.parents('table');
            // Make sure to affect only the correct checkbox column
            table.find('tbody > tr > td:nth-child(' + index + ') input[type="checkbox"]')
            .prop('checked', checkbox[0].checked);

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
            <tr>
                <td className="text-center">
                    <button className="dropdown dropdown-toggle btn" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" id={ p.id }> <i className="icon-list"></i></button>
                    <ul className="dropdown-menu" aria-labelledby={ p.id }>
                        <li><a href="#"> View</a></li>
                        <li><a href="#"> Edit</a></li>
                        <li><a href="#"> Call</a></li>
                        <li><a href="#"> Email</a></li>
                    </ul>
                </td>
                <td className="text-center">{p.number}</td>
                <td className="text-center">John Doe</td>
                <td>{p.street_one}, {p.city} {p.state} {p.zip}</td>
                <td className="text-center">
                    <div data-label="25%" className="radial-bar radial-bar-25 radial-bar-xs"></div>
                </td>
                <td>1 week</td>
            </tr>
        );
        return (
            <div>
                <div className="panel panel-default">
                    <div className=" table-responsive">
                        <table id="" className="table table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th>Actions</th>
                                    <th className="text-center">Project ID</th>
                                    <th className="text-center">Client Name</th>
                                    <th>Address</th>
                                    <th>Progress</th>
                                    <th className="text-center">Last Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                {this.props.policies.map(createItem)}
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        );
    }
});
