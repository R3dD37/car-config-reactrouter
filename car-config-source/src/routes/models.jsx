import CarTile from "../modules/CarTile";
import '../styles/models.css';
import axios from 'axios';
import { useState, useEffect } from 'react';

export default function Models() {
    const [carList, setCarList] = useState();

    useEffect(() => {
        dbCars();
    }, []);

    function dbCars() {
        const url = `http://127.0.0.1:80/KrzysztofSkorzynski/car-config-reactrouter/API/models/`;
        axios.get(url)
            .then((response) => {
                console.log(response.data);
                const cars = response.data;

                var i = 0;

                setCarList(cars.map((car) => <CarTile key={i++} id={car.id_car} name={car.model_name} imgsrc={car.img_src} price={car.base_price} href={"http://localhost:5173/configurator/"+car.id_car}/>));
            });
    }

    return(
        <main>
            <h2>Models</h2>
            <section className="car-list">
                {carList}
            </section>
        </main>
    );
}