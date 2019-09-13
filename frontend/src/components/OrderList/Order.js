import React from "react";
import PropTypes from "prop-types";
import { withStyles } from "@material-ui/core/styles";
import classnames from "classnames";
import Card from "@material-ui/core/Card";
import CardHeader from "@material-ui/core/CardHeader";
import CardMedia from "@material-ui/core/CardMedia";
import CardContent from "@material-ui/core/CardContent";
import CardActions from "@material-ui/core/CardActions";
import Collapse from "@material-ui/core/Collapse";
import Avatar from "@material-ui/core/Avatar";
import IconButton from "@material-ui/core/IconButton";
import Typography from "@material-ui/core/Typography";
import red from "@material-ui/core/colors/red";
import FavoriteIcon from "@material-ui/icons/Favorite";
import ShareIcon from "@material-ui/icons/Share";
import ExpandMoreIcon from "@material-ui/icons/ExpandMore";
import MoreVertIcon from "@material-ui/icons/MoreVert";
import Button from "@material-ui/core/Button";
import Badge from "@material-ui/core/Badge";
import { Link } from "react-router-dom";

const styles = theme => ({
	card: {
		maxWidth: 400
	},
	media: {
		height: 0,
		paddingTop: "56.25%" // 16:9
	},
	actions: {
		display: "flex"
	},
	expand: {
		transform: "rotate(0deg)",
		marginLeft: "auto",
		transition: theme.transitions.create("transform", {
			duration: theme.transitions.duration.shortest
		})
	},
	expandOpen: {
		transform: "rotate(180deg)"
	},
	avatar: {
		backgroundColor: red[500]
	}
});

class OrderCard extends React.Component {
	state = { expanded: false };

	handleExpandClick = () => {
		this.setState(state => ({ expanded: !state.expanded }));
	};

	// componentDidMount()
	// {
	// }

	render() {
		const { classes } = this.props;
		const order = this.props.data;

		return (
			<Card>
				<CardContent>
					{/* order number */}
					<Typography gutterBottom variant="headline" component="h5">
						Order No #345
					</Typography>
					<Typography component="p">Table : 10</Typography>
					<Typography component="p">Customer : Piyush Hanchate</Typography>
					<Typography component="p">Total amount : 500</Typography>
				</CardContent>
				<CardActions>
					<Button
						size="small"
						color="primary"
						href={{
							pathname: "/nearbyfoodcourts/" + order.name,
							state: { orderID: order.id }
						}}
						target="_blank"
					>
						View Items
					</Button>
				</CardActions>
			</Card>
		);
	}
}

OrderCard.propTypes = {
	classes: PropTypes.object.isRequired
};

export default withStyles(styles)(OrderCard);
