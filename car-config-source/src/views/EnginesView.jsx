import EngineTile from "../modules/EngineTile";
import "./style/engines-view-style.css";
import axios from 'axios';
import { useState } from "react";
import { useEffect } from "react";

/**
 * 
 * @param {{idCar: numeric}} props 
 * @returns 
 */

export default function EnginesView(props) {

    const [engineList, setEngines] = useState();

    const id = props.idCar;

    console.log(id);

    useEffect(() => {
        dbEngines();
    }, []);

    function dbEngines() {
        const url = `http://127.0.0.1:80/KrzysztofSkorzynski/car-config-reactrouter/API/engines/${id}`;
        axios.get(url)
            .then((response) => {
                console.log(response.data);
                const engines = response.data;
                setEngines(engines.map((e) => <EngineTile key={e.id}
                id={e.id}
                driveName={e.d_name}
                emission={e.emission} fuelConsumption={e.fuel_consumption}
                 fuelUnits={e.fuel_comp_units} hybridPower={e.hybrid_power}
                 powerHP={e.power_KM} powerkW={e.power_kW}
                 base_price={e.base_price}/>));
            });
    }

    

    return (
        <div className="engines-view">
            {engineList}
        </div>
    );
}