import React from 'react';
import { Link } from 'react-router-dom';

export default() => {
    return (
        <div>
            I am on other Page!
            <Link to="/"> Go back to calculator</Link>
        </div>
    )
};