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
    render: function() {
        // var createItem = (p) => (
        //         <tr id={p.id} key={p.id} onClick={this.handleClick}>
        //             <td>{p.number}</td>
        //             <td>{p.street_one}</td>
        //             <td>{p.city}</td>
        //             <td>{p.state}</td>
        //             <td>{p.zip}</td>
        //         </tr>
        // );
        return (
            <div>
                <h3>Tables
                    <small>A showcase of different components inside tables</small>
                </h3>

                <div className="panel panel-default">
                    <div className="panel-heading">Demo Table #1</div>

                    <table id="table-ext-1" responsive bordered hover>
                        <thead>
                            <tr>
                                <th>UID</th>
                                <th>Picture</th>
                                <th>Username</th>
                                <th>First Name</th>
                                <th>Last Name</th>
                                <th>Email</th>
                                <th>Profile</th>
                                <th>Last Login</th>
                                <th data-check-all="data-check-all">
                                    <div data-toggle="tooltip" data-title="Check All" className="checkbox c-checkbox">
                                        <label>
                                            <input type="checkbox" />
                                            <em className="fa fa-check"></em>
                                        </label>
                                    </div>
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>
                                    <div className="media">
                                        <img src="img/user/01.jpg" alt="Image" className="img-responsive img-circle" />
                                    </div>
                                </td>
                                <td>@twitter</td>
                                <td>Larry</td>
                                <td>the Bird</td>
                                <td>mail@example.com</td>
                                <td className="text-center">
                                    <div data-label="25%" className="radial-bar radial-bar-25 radial-bar-xs"></div>
                                </td>
                                <td>1 week</td>
                                <td>
                                    <div className="checkbox c-checkbox">
                                        <label>
                                            <input type="checkbox" />
                                            <em className="fa fa-check"></em>
                                        </label>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>
                                    <div className="media">
                                        <img src="img/user/02.jpg" alt="Image" className="img-responsive img-circle" />
                                    </div>
                                </td>
                                <td>@mdo</td>
                                <td>Mark</td>
                                <td>Otto</td>
                                <td>mail@example.com</td>
                                <td className="text-center">
                                    <div data-label="50%" className="radial-bar radial-bar-50 radial-bar-xs"></div>
                                </td>
                                <td>25 minutes</td>
                                <td>
                                    <div className="checkbox c-checkbox">
                                        <label>
                                            <input type="checkbox" />
                                            <em className="fa fa-check"></em>
                                        </label>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>
                                    <div className="media">
                                        <img src="img/user/03.jpg" alt="Image" className="img-responsive img-circle" />
                                    </div>
                                </td>
                                <td>@fat</td>
                                <td>Jacob</td>
                                <td>Thornton</td>
                                <td>mail@example.com</td>
                                <td className="text-center">
                                    <div data-label="80%" className="radial-bar radial-bar-80 radial-bar-xs"></div>
                                </td>
                                <td>10 hours</td>
                                <td>
                                    <div className="checkbox c-checkbox">
                                        <label>
                                            <input type="checkbox" />
                                            <em className="fa fa-check"></em>
                                        </label>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>

                </div>

            </div>
        );
    }

});
