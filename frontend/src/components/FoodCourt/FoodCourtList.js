import React from "react";
import FoodCourtCard from "./FoodCourt";
import { withStyles } from "@material-ui/core/styles";
import { connect } from "react-redux";
import Container from "@material-ui/core/Container";
import { Spin, Icon } from "antd";
import axios from "axios";
import Grid from "@material-ui/core/Grid";
import TextField from "@material-ui/core/TextField";
import SearchResults from "react-filter-search";

const antIcon = (
	<Icon type="loading" style={{ fontSize: 50, margin: "200%" }} spin />
);

const styles = theme => ({
	root: {
		width: "100%",
		maxWidth: 360,
		backgroundColor: theme.palette.background.paper
	},
	inline: {
		display: "inline"
	}
});

class FoodCourtList extends React.Component {
	constructor(props) {
		super(props);
		this.state = {
			foodCourts: [],
			isLoading: true,
			searchString: ""
		};
	}

	componentWillMount() {
		axios.defaults.headers.common = {
			"Content-Type": "application/json",
			Authorization: `Token ${this.props.token}`
		};

		axios
			.get("http://localhost:8000/restaurants/nearbyfoodcourts/")
			.then(res => this.setState({ foodCourts: res.data }))
			.catch(err => console.log(err));
	}

	componentDidMount() {
		this.setState({ isLoading: false });
	}

	// this.setState({ users: res.data })
	onSearchInputChange = event => {
		console.log("Search changed ..." + event.target.value);
		if (event.target.value) {
			this.setState({ searchString: event.target.value });
		} else {
			this.setState({ searchString: "" });
		}
		//this.forceUpdate();
	};

	render() {
		var isLoading = this.state.isLoading;
		const foodCourts = this.state.foodCourts;

		return (
			

			<Container>
				{isLoading ? (
					<Spin indicator={antIcon} />
				) : (
					<div>
						{foodCourts ? (
							<div>
								<TextField
									style={{ padding: 24 }}
									id="searchInput"
									placeholder="Search for food courts"
									margin="normal"
									onChange={this.onSearchInputChange}
								/>
								<SearchResults
									value={this.state.searchString}
									data={foodCourts}
									renderResults={results => (
										<Grid container spacing={0} style={{ padding: 24 }}>
											{results.map(foodCourt => (
												<Grid item xs={12} sm={6} lg={4} xl={3}>
													<FoodCourtCard key={foodCourt.id} data={foodCourt} />
												</Grid>
											))}
										</Grid>
									)}
								/>
							</div>
						) : (
							"No foodcourts found"
						)}
					</div>
				)}
			</Container>
		);
	}
}

const mapStateToProps = state => {
	return {
		token: state.authReducer.token
	};
};

export default connect(mapStateToProps)(withStyles(styles)(FoodCourtList));
