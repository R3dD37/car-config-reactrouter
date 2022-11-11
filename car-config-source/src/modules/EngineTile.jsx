import "./styles/engine-tile-style.css";
import "./styles/checkbox-style.css";

/**
 * 
 * @param {{id: numeric, driveName: string, powerkW: numeric, powerHP: numeric, hybridPower: string, fuelConsumption: numeric, fuelUnits: string, emission: string, base_price: numeric}} props 
 * @returns 
 */

export default function EngineTile(props) {
    return (
        <label htmlFor={`engine${props.id}`}>
            <div className="engine-tile">
                <header>
                    <span>{props.driveName}</span>
                    <input type="radio" name={`engine`} id={`engine${props.id}`} />
                </header>
                <hr/>
                <section>
                    <table>
                        <tbody>
                            <tr>
                                <td>
                                    <span>Power</span><br/>
                                    <span className="bold">{props.powerkW} kW/{props.powerHP} KM</span>
                                </td>
                                <td>
                                    <span>Hybrid power</span><br/>
                                    <span className="bold">{props.hybridPower}</span>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span>Fuel consumption</span><br/>
                                    <span className="bold">{props.fuelConsumption} {props.fuelUnits}</span>
                                </td>
                                <td>
                                    <span>CO₂ emmision</span><br/>
                                    <span className="bold"  >{props.emission} g/km</span>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </section>
                <hr />
                <footer>
                    <span>{Math.round(props.base_price).toLocaleString()} PLN</span>
                </footer>
            </div>
        </label>
    );
}